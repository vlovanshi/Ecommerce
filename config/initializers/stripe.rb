Rails.configuration.stripe = {
  :publishable_key => 'pk_test_MfCGzAZrzfidNNVeY4i0U8ds',
  :secret_key      => 'sk_test_jrmdtukLpUvtAn4MQ82lt2fq'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]