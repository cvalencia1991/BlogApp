module TZInfo
  module Data
    # TZInfo::Data version number.
    VERSION = '1.2022.7'

    # TZInfo::Data version information.
    module Version
      # The format of the Ruby modules. The only format currently supported by
      # TZInfo is version 1.
      FORMAT = 1

      # TZInfo::Data version number.
      STRING = VERSION

      # The version of the {IANA Time Zone Database}[https://www.iana.org/time-zones]
      # used to generate this version of TZInfo::Data.
      TZDATA = '2022g'
    end
  end
end
