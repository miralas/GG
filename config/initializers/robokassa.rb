Robokassa::Interface

module Robokassa

  def self.client
    Interface.new Interface.get_options_by_notification_key(nil)
  end

  class Interface
    class << self
      def get_options_by_notification_key(key)
        {
          test_mode: false,
          login: 'guideofmoney',
          password1: '25111997daria'
        }
      end

      def success_implementation(invoice_id, *args)
        Payment.find(invoice_id).confirm!
      end

      def fail_implementation(invoice_id, *args)
        Payment.find(invoice_id).mark_failed!
      end

      def notify_implementation(invoice_id, *args)
        Payment.find(invoice_id).verifity!
      end
    end
  end
end