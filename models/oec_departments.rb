class OECDepartments

  attr_accessor :dept_code, :file_name, :form_code

  def initialize(dept_code, file_name, form_code)
    @dept_code = dept_code
    @dept_name = file_name
    @form_code = form_code
  end

  DEPARTMENTS = [
      AFRICAM = new('AFRICAM', 'African American Studies', 'AFRICAM'),
      AFRIKANS = new('AFRKANS', 'German', 'GERMAN'),
      AGR_CHM = new('AGR CHM', 'Plant Biology', 'PLANTBI'),
      AMERSTD = new('AMERSTD', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      ANTHRO = new('ANTHRO', 'Anthropology', 'ANTHRO'),
      A_RESEC = new('A,RESEC', 'Agricultural and Resource Economics', 'A,RESEC'),
      ASIANST = new('ASIANST', 'International and Area Studies', 'IAS'),
      AST = new('AST', 'Engineering', 'ENGIN'),
      ASTRON = new('ASTRON', 'Astronomy', 'ASTRON'),
      BIC = new('BIC', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      BIO_ENG = new('BIO ENG', 'Bioengineering', 'BIO ENG'),
      CATALAN = new('CATALAN', 'Spanish and Portuguese', 'SPANISH'),
      CHEM = new('CHEM', 'Chemistry', 'CHEM'),
      CIV_ENG = new('CIV ENG', 'Civil and Environmental Engineering', 'CIV ENG'),
      COG_SCI = new('COG SCI', 'International and Area Studies', 'IAS'),
      COLWRIT = new('COLWRIT', 'College Writing', 'COLWRIT'),
      COM_LIT = new('COM LIT', 'Comparative Literature', 'COM LIT'),
      COMPBIO = new('COMPBIO', 'Graduate Division', 'LAN PRO'),
      COMPSCI = new('COMPSCI', 'Electrical Engineering and Computer Science', 'COMPSCI'),
      DATASCI = new('DATASCI', 'Information', 'INFO'),
      DES_INV = new('DES INV', 'Engineering', 'ENGIN'),
      DEV_ENG = new('DEV ENG', 'Civil and Environmental Engineering', 'CIV ENG'),
      DEV_STD = new('DEV STD', 'International and Area Studies', 'IAS'),
      DUTCH = new('DUTCH', 'German', 'GERMAN'),
      ECON = new('ECON', 'Economics', 'ECON'),
      EECS = new('EECS', 'Electrical Engineering and Computer Science', 'EL ENG'),
      EL_ENG = new('EL ENG', 'Electrical Engineering and Computer Science', 'EL ENG'),
      ENE_RES = new('ENE,RES', 'Energy and Resources Group', 'ENE,RES'),
      ENGIN = new('ENGIN', 'Engineering', 'ENGIN'),
      ENVECON = new('ENVECON', 'Agricultural and Resource Economics', 'A,RESEC'),
      ENV_SCI = new('ENV SCI',  'Environmental Science, Policy, and Management', 'ESPM'),
      EPS = new('EPS', 'Earth and Planetary Science', 'EPS'),
      ESPM = new('ESPM', 'Environmental Science, Policy, and Management', 'ESPM'),
      ETH_STD = new('ETH STD', 'Ethnic Studies', 'ETH STD'),
      FSSEM = new('FSSEM', 'Freshman and Sophomore Seminars', 'FSSEM'),
      GEOG = new('GEOG', 'Geography', 'GEOG'),
      GERMAN = new('GERMAN', 'German', 'GERMAN'),
      GLOBAL = new('GLOBAL', 'International and Area Studies', 'IAS'),
      GPP = new('GPP', 'International and Area Studies', 'IAS'),
      GSPDP = new('GSPDP', 'Graduate Division', 'LAN PRO'),
      GWS = new('GWS', 'Gender and Women\'s Studies', 'GWS'),
      HMEDSCI = new('HMEDSCI', 'Public Health', 'PB HLTH'),
      IAS = new('IAS', 'International and Area Studies', 'IAS'),
      ILA = new('ILA', 'Spanish and Portuguese', 'SPANISH'),
      IND_ENG = new('IND ENG', 'Industrial Engineering and Operations Research', 'IND ENG'),
      INFO = new('INFO', 'Information', 'INFO'),
      INTEGBI = new('INTEGBI', 'Integrative Biology', 'INTEGBI'),
      ISF = new('ISF', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      JOURN = new('JOURN', 'Journalism', 'JOURN'),
      L_AND_S = new('L & S', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      LAN_PRO = new('LAN PRO', 'Graduate Division', 'LAN PRO'),
      LATAMST = new('LATAMST', 'Graduate Division', 'LAN PRO'),
      LEGALST = new('LEGALST', 'Law', nil),
      LGBT = new('LGBT', 'Gender and Women\'s Studies', 'GWS'),
      LINGUIS = new('LINGUIS', 'Linguistics', 'LINGUIS'),
      MATH = new('MATH', 'Math', 'MATH'),
      MAT_SCI = new('MAT SCI', 'Materials Science and Engineering', 'MAT SCI'),
      MCELLBI = new('MCELLBI', 'Molecular and Cell Biology', 'MCELLBI'),
      MEC_ENG = new('MEC ENG', 'Mechanical Engineering', 'MEC ENG'),
      MEDIAST = new('MEDIAST', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      M_E_STU = new('M E STU', 'International and Area Studies', 'IAS'),
      MUSIC = new('MUSIC', 'Music', 'MUSIC'),
      NAT_RES = new('NAT RES', 'Natural Resources', 'NAT RES'),
      NEUROSC = new('NEUROSC', 'Helen Wills Neuroscience', 'NEUROSC'),
      NSE = new('NSE', 'Engineering', 'ENGIN'),
      NUC_ENG = new('NUC ENG', 'Nuclear Engineering', 'NUC ENG'),
      NUSCTX = new('NUSCTX', 'Nutritional Sciences and Toxicology', 'NUSCTX'),
      NWMEDIA = new('NWMEDIA', 'New Media', 'NWMEDIA'),
      PACS = new('PACS', 'International and Area Studies', 'IAS'),
      PB_HLTH = new('PB HLTH', 'Public Health', 'PB HLTH'),
      PHYS_ED = new('PHYS ED', 'Physical Education', 'PHYS ED'),
      PHYSICS = new('PHYSICS', 'Physics', 'PHYSICS'),
      PLANTBI = new('PLANTBI', 'Plant Biology', 'PLANTBI'),
      POLECON = new('POLECON', 'International and Area Studies', 'IAS'),
      POL_SCI = new('POL SCI', 'Political Science', 'POL SCI'),
      PORTUG = new('PORTUG', 'Spanish and Portuguese', 'SPANISH'),
      PSYCH = new('PSYCH', 'Psychology', 'PSYCH'),
      PUB_POL = new('PUB POL', 'Goldman School of Public Policy', 'PUB POL'),
      RELIGST = new('RELIGST', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      RHETOR = new('RHETOR', 'Rhetoric', 'RHETOR'),
      SOC_WEL = new('SOC WEL', 'Social Welfare', 'SOC WEL'),
      SPANISH = new('SPANISH', 'Spanish and Portuguese', 'SPANISH'),
      STAT = new('STAT', 'Statistics', 'STAT'),
      THEATER = new('THEATER', 'Theater, Dance, and Performance', 'THEATER'),
      UGIS = new('UGIS', 'Undergraduate and Interdisciplinary Studies', 'UGIS'),
      YIDDISH = new('YIDDISH', 'German', 'GERMAN')
  ]

end