require 'serverspec'
require 'docker'

set :backend, :exec

describe "DockerImage" do
  images = Docker::Image.all


  images.each do |i|
    i.info['RepoTags'].each do |tag|
      if tag.eql? "andyaugustin/docker_ubuntu1404_grpc:latest"
        @imageToTest = i
      end
    end
  end


  it "image exists" do
    assert(@imageToTest).to exist
    assert(false).to be true
  end

end
