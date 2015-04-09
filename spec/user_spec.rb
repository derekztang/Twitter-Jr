require 'spec_helper'

describe User do
	it "should have followers and followees" do
		bob = User.create!
		laura = User.create!
		cam = User.create!
		joe = User.create!
		pete = User.create!
	end
end

