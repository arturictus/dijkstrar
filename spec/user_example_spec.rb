require 'spec_helper'

class User < Contextuable; end

module Dijkstrar

  describe 'Users net' do

    it "root to 10 => [1, 2, 10]" do
      f3 = User.new(id: '3')
      f2 = User.new(id: '2')
      root = User.new(id: '1')
      root.links = [f2]
      f2.links = [f3, root]
      f3.links = [f2]
      expect(Dijkstrar::Distances.new(root).path_to(f3)).to eq ''
    end

  end
end
