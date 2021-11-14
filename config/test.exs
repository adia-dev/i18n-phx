import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :i18n, I18nWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "f64Pi+nVlrdtgi2e5Y2nPoN479oD3kzC2FHBWEFw0yQLaiz7vOmv3xnu3jciHoQx",
  server: false

# In test we don't send emails.
config :i18n, I18n.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
