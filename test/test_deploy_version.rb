require 'helper'

class TestDeployVersion < Test::Unit::TestCase

  def setup
    @version = Deploy::Version.new
    @version.current_version = '1'
    @version.deployed_by = 'me'
  end

  def dead_beef
    0xDEADBEEF
  end

  should 'add a custom value' do
    @version.add :cluster_id, dead_beef
    assert_equal @version.to_h[:custom_values][:cluster_id], dead_beef
  end

end
