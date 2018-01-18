require_relative '../../util/spec_helper'

describe 'BOAC' do

  include Logging

  search_criteria = BOACUtils.get_test_search_criteria
  @driver = Utils.launch_browser
  @homepage = Page::BOACPages::HomePage.new @driver
  @cohort_page = Page::BOACPages::CohortPage.new @driver
  @matrix_page = Page::BOACPages::CohortMatrixPage.new @driver
  @student_page = Page::BOACPages::StudentPage.new @driver
  @homepage.dev_auth Utils.super_admin_uid
  @homepage.click_create_new_cohort

  # Navigate the various cohort/student views using each of the test search criteria
  search_criteria.each do |search|

    begin
      criteria = "#{search.squads && (search.squads.map &:name)}, #{search.levels}, #{search.majors}, #{search.gpa_ranges}"

      # Every other search starts from list view
      if search_criteria.index(search).even?

        # Make sure a list view button is present from the previous loop. If not, load a team cohort to obtain an initial list view.
        @cohort_page.load_team_page Team::TEAMS.last unless @cohort_page.list_view_button?

        @cohort_page.click_list_view
        @cohort_page.perform_search search
        list_results_count = @cohort_page.results_count

        if list_results_count.zero?

          rows_visible = @cohort_page.player_link_elements.any?
          it("shows no results on list view cohort search for #{criteria}") { expect(rows_visible).to be false }

          logger.warn 'No results, skipping further tests'

        else

          # Page through results

          list_results_length = @cohort_page.visible_search_results.length
          list_results_page = @cohort_page.list_view_current_page

          logger.info "Got #{list_results_length} list view results"

          it("shows the right list view cohort search results count for #{criteria}") { expect(list_results_count).to eql(list_results_length) }

          # Navigate to student page and back.

          student = User.new({:sis_id => @cohort_page.list_view_sids.last})
          @cohort_page.click_player_link student
          @student_page.click_return_to_cohort

          list_search_preserved = @cohort_page.search_criteria_selected? search
          list_results_count_preserved = @cohort_page.verify_block { @cohort_page.wait_until { @cohort_page.results_count == list_results_count } }
          list_results_page_preserved = @cohort_page.list_view_page_selected? list_results_page

          it("preserves cohort search criteria #{criteria} when returning to list view from the student #{student.sis_id} page") { expect(list_search_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results count when returning to list view from the student #{student.sis_id} page") { expect(list_results_count_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results page when returning to list view from the student #{student.sis_id} page") { expect(list_results_page_preserved).to be true }

          # Switch to matrix view

          @cohort_page.click_matrix_view
          scatterplot_uids = @matrix_page.visible_matrix_uids @driver
          no_data_uids = @matrix_page.visible_no_data_uids

          logger.info "Got #{scatterplot_uids.length + no_data_uids.length} matrix view UIDs"

          matrix_search = @matrix_page.search_criteria_selected? search
          matrix_results_count = (scatterplot_uids.length + no_data_uids.length == list_results_count)

          it("preserves cohort search criteria #{criteria} when switching to matrix view") { expect(matrix_search).to be true }
          it("preserves the cohort search criteria #{criteria} results count when switching to matrix view") { expect(matrix_results_count).to be true }

          # Navigate to student page and back. Click a bubble if there are any; otherwise a 'no data' row.

          scatterplot_uids.any? ? @matrix_page.click_last_student_bubble(@driver) : @matrix_page.click_last_no_data_student
          @student_page.click_return_to_cohort
          scatterplot_uids = @matrix_page.visible_matrix_uids @driver
          no_data_uids = @matrix_page.visible_no_data_uids

          matrix_search_preserved = @matrix_page.search_criteria_selected? search
          matrix_results_count_preserved =  (scatterplot_uids.length + no_data_uids.length == list_results_count)

          it("preserves cohort search criteria #{criteria} when returning to matrix view from the student page") { expect(matrix_search_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results count when returning to matrix view from the student page") { expect(matrix_results_count_preserved).to be true }
        end

      # Every other search starts from matrix view
      else

        # Make sure a matrix view button is present. If not, load a team cohort to obtain matrix view.

        @cohort_page.load_team_page Team::TEAMS::TNW unless @cohort_page.matrix_view_button?

        @cohort_page.click_matrix_view
        @cohort_page.perform_search search
        matrix_results_count = @cohort_page.results_count
        scatterplot_uids = @matrix_page.visible_matrix_uids @driver
        no_data_uids = @matrix_page.visible_no_data_uids
        total_results = scatterplot_uids.length + no_data_uids.length

        logger.info "Got #{total_results} matrix view UIDs"

        it("shows the cohort search results count for #{criteria}") { expect(matrix_results_count).to eql(total_results) }

        if matrix_results_count.zero?

          bubbles_visible = @matrix_page.visible_matrix_uids.any?
          rows_visible = @matrix_page.visible_no_data_uids.any?

          it("shows no bubbles on matrix view cohort search for #{criteria}") { expect(bubbles_visible).to be false }
          it("shows no rows on matrix view cohort search for #{criteria}") { expect(rows_visible).to be false }

          logger.warn 'No results, skipping further tests'

        else

          # Navigate to student page and back. Click a bubble if there are any; otherwise a 'no data' row.

          scatterplot_uids.any? ? @matrix_page.click_last_student_bubble(@driver) : @matrix_page.click_last_no_data_student
          @student_page.click_return_to_cohort
          scatterplot_uids = @matrix_page.visible_matrix_uids @driver
          no_data_uids = @matrix_page.visible_no_data_uids

          matrix_search_preserved = @matrix_page.search_criteria_selected? search
          matrix_results_count_preserved =  (scatterplot_uids.length + no_data_uids.length == matrix_results_count)

          it("preserves cohort search criteria #{criteria} when returning to matrix view from the student page") { expect(matrix_search_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results count when returning to matrix view from the student page") { expect(matrix_results_count_preserved).to be true }

          # Switch to list view, and page through results.

          @matrix_page.click_list_view
          results_length = @cohort_page.visible_search_results.length
          list_results_count = @cohort_page.results_count
          list_results_page = @cohort_page.list_view_current_page

          logger.info "Got #{results_length} list view results"

          it("shows the cohort search results count for #{criteria}") { expect(list_results_count).to eql(results_length) }

          # Navigate to student page and back.

          student = User.new({:sis_id => @cohort_page.list_view_sids.last})
          @cohort_page.click_player_link student
          @student_page.click_return_to_cohort

          list_search_preserved = @cohort_page.search_criteria_selected? search
          list_results_count_preserved = @cohort_page.wait_until { @cohort_page.results_count == matrix_results_count }
          list_results_page_preserved = @cohort_page.list_view_page_selected? list_results_page

          it("preserves cohort search criteria #{criteria} when returning to list view from the student #{student.sis_id} page") { expect(list_search_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results count when returning to list view from the student #{student.sis_id} page") { expect(list_results_count_preserved).to be true }
          it("preserves the cohort search criteria #{criteria} results page when returning to list view from the student #{student.sis_id} page") {expect(list_results_page_preserved).to be true }
        end
      end

    rescue => e
      Utils.log_error e
      it('threw an error') { fail }
    end
  end
end
