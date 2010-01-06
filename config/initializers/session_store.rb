# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photospace_session',
  :secret      => 'a45abab93df3fd0f7f406cb120a7c937b4ce8efcb0283fce609316630cd1ca48c9e3d155308d84f620230e5d03592fedd9f1610b12a1ed5ad9b3cc2818987d71'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
