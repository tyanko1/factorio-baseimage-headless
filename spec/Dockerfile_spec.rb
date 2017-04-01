require 'spec_helper.rb'

describe 'Dockerfile' do
  describe docker_build('.') do
    it { should have_cmd ['/sbin/my_init'] }

    describe docker_run(described_image) do
      files =
       ['/etc/service/factorio',
       '/etc/service/factorio/run',
       '/opt/factorio/config',
       '/opt/factorio'].each do |file|

        describe file("#{file}") do
          it { should exist }
        end
      end
    end 
  end
end
