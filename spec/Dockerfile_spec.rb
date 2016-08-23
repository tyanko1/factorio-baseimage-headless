require 'spec_helper.rb'

describe 'Dockerfile' do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')
    set :os, family: :debian
    set :backend, :docker
    set :docker_image, @image.id

    @container = Docker::Container.create('Image' => @image.id)
    @container.start
  end

  after(:all) do
    @container.kill
    @container.delete(:fore => true)
  end

  it 'create the factorio directories' do
    expect(file('/opt/factorio')).to exist
  end

  it 'create the factorio init directory' do
    expect(file('/etc/service/factorio')).to exist
  end

#  it 'should expose the correct ports' do
#    expect(@image.json['ContainerConfig']['ExposedPorts']).to include("34197:10000/udp")
#  end

 # describe docker_container('spec_test') do
 #   it { should have_volume('/var/factorio/users') }
 # end

  it 'should mount the config volume' do
    expect(file('/opt/factorio/config')).to exist
  end

  it 'should mount the save volume' do
    expect(file('/opt/factorio/saves')).to exist
  end
end
