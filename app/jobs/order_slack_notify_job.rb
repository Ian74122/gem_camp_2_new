class OrderSlackNotifyJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = Order.find order_id
    notifier = Slack::Notifier.new 'https://hooks.slack.com/services/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'
    notifier.ping "user: #{order.user.email}, place order amount #{order.amount}"
  end
end
