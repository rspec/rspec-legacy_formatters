module FormatterSupport

  def send_notification type, notification
    reporter.notify type, notification
  end

  def reporter
    @reporter ||= setup_reporter
  end

  def setup_reporter(*streams)
    config.add_formatter described_class, *streams
    @formatter = config.formatters.first
    @reporter = config.reporter
  end

  def output
    @output ||= StringIO.new
  end

  def config
    @configuration ||=
      begin
        config = RSpec::Core::Configuration.new
        config.output_stream = output
        config
      end
  end

  def configure
    yield config
  end

  def formatter
    @formatter ||=
      begin
        setup_reporter
        @formatter
      end
  end

  def example
    instance_double("RSpec::Core::Example",
                    :description      => "Example",
                    :example_group    => group,
                    :full_description => "Example",
                    :execution_result => instance_double(RSpec::Core::Example::ExecutionResult, :exception => Exception.new).as_null_object ,
                    :metadata         => {}
                   )
  end

  def group
    class_double(
      "RSpec::Core::ExampleGroup",
      :description => "Group",
      :parent_groups => [],
      :top_level? => false
    )
  end

  def start_notification(count)
   ::RSpec::Core::Notifications::StartNotification.new count
  end

  def example_notification(specific_example = example)
   ::RSpec::Core::Notifications::ExampleNotification.for specific_example
  end

  def group_notification
   ::RSpec::Core::Notifications::GroupNotification.new group
  end

  def message_notification(message)
    ::RSpec::Core::Notifications::MessageNotification.new message
  end

  def null_notification
    ::RSpec::Core::Notifications::NullNotification
  end

  def seed_notification(seed, used = true)
    ::RSpec::Core::Notifications::SeedNotification.new seed, used
  end

  def summary_notification(duration, examples, failed, pending, time)
    ::RSpec::Core::Notifications::SummaryNotification.new duration, examples, failed, pending, time
  end

end
