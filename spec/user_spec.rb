require 'spec_helper'

describe User do
	it "should have followers and followees" do
		bob = User.create!
		laura = User.create!
		cam = User.create!
		joe = User.create!
		pete = User.create!

    bob.followees << laura
    bob.followees << cam
    bob.followers << joe
    bob.followers << pete
    bob.save!

    bob.reload

    expect(bob.followees).to include laura
    expect(bob.followees).to include cam
    expect(bob.followers).to include joe
    expect(bob.followers).to include pete

    expect(laura.followers).to include bob
    expect(cam.followers).to include bob
    expect(joe.followees).to include bob
    expect(pete.followees).to include bob

	end
end
