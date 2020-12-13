require "greensms/api/schema"

module GreenSMS
  MODULES = {
    "account" => {
      "schema" => GreenSMS::VALIDATION_SCHEMA["account"],
      "versions" => {
        "v1" => {
          "balance" => {
            "args" => nil,
            "method" => "GET",
          },
          "token" => {
            "args" => ["params"],
            "method" => "POST",
          },
          "tariff" => {
            "args" => nil,
            "method" => "GET",
          },
        },
      },
    },
    "general" => {
      "schema" => {},
      "static" => true,
      "versions" => {
        "v1" => {
          "status" => {
            "args" => nil,
            "method" => "GET",
          },
        },
      },
    },
    "call" => {
      "schema" => GreenSMS::VALIDATION_SCHEMA["call"],
      "versions" => {
        "v1" => {
          "send" => {
            "args" => ["params"],
            "method" => "POST",
          },
          "status" => {
            "args" => ["params"],
            "method" => "GET",
          },
        },
      },
    },
    "whois" => {
      "schema" => GreenSMS::VALIDATION_SCHEMA["whois"],
      "versions" => {
        "v1" => {
          "lookup" => {
            "args" => ["params"],
            "method" => "GET",
          },
        },
      },
    },
    "voice" => {
      "schema" => GreenSMS::VALIDATION_SCHEMA["voice"],
      "versions" => {
        "v1" => {
          "send" => {
            "args" => ["params"],
            "method" => "POST",
          },
          "status" => {
            "args" => ["params"],
            "method" => "GET",
          },
        },
      },
    },
  # "pay" => {
  #   "schema" => GreenSMS::VALIDATION_SCHEMA["pay"],
  #   "versions" => {
  #     "v1" => {
  #       "send" => {
  #         "args" => ["params"],
  #         "method" => "POST",
  #       },
  #       "status" => {
  #         "args" => ["params"],
  #         "method" => "GET",
  #       },
  #     },
  #   },
  # },
  # "hlr" => {
  #   "schema" => GreenSMS::VALIDATION_SCHEMA["hlr"],
  #   "versions" => {
  #     "v1" => {
  #       "send" => {
  #         "args" => ["params"],
  #         "method" => "POST",
  #       },
  #       "status" => {
  #         "args" => ["params"],
  #         "method" => "GET",
  #       },
  #     },
  #   },
  # },
  # "sms" => {
  #   "schema" => GreenSMS::VALIDATION_SCHEMA["sms"],
  #   "versions" => {
  #     "v1" => {
  #       "send" => {
  #         "args" => ["params"],
  #         "method" => "POST",
  #       },
  #       "status" => {
  #         "args" => ["params"],
  #         "method" => "GET",
  #       },
  #     },
  #   },
  # },
  # "viber" => {
  #   "schema" => GreenSMS::VALIDATION_SCHEMA["viber"],
  #   "versions" => {
  #     "v1" => {
  #       "send" => {
  #         "args" => ["params"],
  #         "method" => "POST",
  #       },
  #       "status" => {
  #         "args" => ["params"],
  #         "method" => "GET",
  #       },
  #     },
  #   },
  # },
  # "social" => {
  #   "schema" => GreenSMS::VALIDATION_SCHEMA["social"],
  #   "versions" => {
  #     "v1" => {
  #       "send" => {
  #         "args" => ["params"],
  #         "method" => "POST",
  #       },
  #       "status" => {
  #         "args" => ["params"],
  #         "method" => "GET",
  #       },
  #     },
  #   },
  # },
  }
end
