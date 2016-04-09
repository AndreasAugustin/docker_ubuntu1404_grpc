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

=begin
  it "image exists" do
    expect(@imageToTest).to exist
  end
=end
end
