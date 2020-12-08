module GreenSMS
  class ::Hash
    def deep_merge(second)
      merger = proc { |_, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
      merge(second.to_h, &merger)
    end
  end

  to_schema = {
    "type" => "string",
    "minlength" => 11,
    "maxlength" => 14,
    "pattern" => "^[0-9]+",
  }

  id_schema = {
    "type" => "string",
    "minlength" => 36,
    "maxlength" => 36,
  }

  common_schema = {
    "v1" => {
      "send" => {
        "type" => "object",
        "required" => ["to"],
        "properties" => {
          "to" => to_schema,
        },
      },
      "status" => {
        "type" => "object",
        "required" => ["id"],
        "properties" => {
          "id" => id_schema,
          "extended" => {
            "type" => "boolean",
          },
        },
      },
    },
  }

  VALIDATION_SCHEMA = {
    "account" => {
      "v1" => {
        "token" => {
          "type" => "object",
          "required" => [],
          "properties" => {
            "expire" => {
              "type" => "integer",
              "minimum" => 0,
            },
          },
        },
      },
    },
    "call" => common_schema,
    "hlr" => common_schema,
    "whois" => {
      "v1" => {
        "lookup" => {
          "type" => "object",
          "required" => ["to"],
          "properties" => {
            "to" => to_schema,
          },
        },
      },
    },
    "general" => {},
    "voice" => common_schema.deep_merge(
      {
        "v1" => {
          "send" => {
            "type" => "object",
            "required" => ["txt"],
            "properties" => {
              "txt" => {
                "type" => "string",
                "minlength" => 1,
                "maxlength" => 5,
                "pattern" => "^[0-9]+",
              },
              "lang" => {
                "type" => "string",
              # "allowed" => ["ru", "en"],
              },
            },
          },
        },
      }
    ),
    "pay" => common_schema.deep_merge({
      "v1" => {
        "send" => {
          "type" => "object",
          "required" => ["amount"],
          "properties" => {
            "amount" => {
              "type" => "number",
              "min" => 1,
            },
            "tag" => {
              "type" => "string",
            },
          },
        },
      },
    }),
    "sms" => common_schema.deep_merge(
      {
        "v1" => {
          "send" => {
            "type" => "object",
            "required" => ["txt"],
            "properties" => {
              "txt" => {
                "type" => "string",
                "minlength" => 1,
              },
              "from" => {
                "type" => "string",
              },
              "tag" => {
                "type" => "string",
              },
              "hidden" => {
                "type" => "string",
              },
            },
          },
        },
      }
    ),
    "viber" => common_schema.deep_merge(
      {
        "v1" => {
          "send" => {
            "type" => "object",
            "required" => ["txt"],
            "properties" => {
              "txt" => {
                "type" => "string",
                "minlength" => 1,
              },
              "from" => {
                "type" => "string",
              },
              "cascade" => {
                "type" => "string",
                "allowed" => ["sms", "voice"],
              },
            },
          },
        },
      }
    ),
    "social" => common_schema.deep_merge(
      {
        "v1" => {
          "send" => {
            "type" => "object",
            "required" => ["txt"],
            "properties" => {
              "txt" => {
                "type" => "string",
                "minlength" => 1,
              },
              "from" => {
                "type" => "string",
              },
              "tag" => {
                "type" => "string",
              },
              "hidden" => {
                "type" => "string",
              },
            },
          },
        },
      }
    ),

  }
end
