require 'spec_helper'

describe User do

  def create_user(name)
    User.create! username: name, password: 'password'
  end
	it "should have followers and followees" do
		bob = create_user('bob')
		laura = create_user('laura')
		cam = create_user('cam')
		joe = create_user('joe')
		pete = create_user('pete')

    bob.followers << laura
    expect(bob.followers).to include laura
    expect(laura.followees).to include bob

    bob.followers.delete(laura)
    expect(bob.followers).to_not include laura
    expect(laura.followees).to_not include bob
	end

  it "should have many tweets" do
    bob = create_user('bob')
    bob.tweets.create!(content: "hi im bob")

    tweet1 = Tweet.last
    expect(tweet1.user).to eq bob
    expect(tweet1.content).to eq "hi im bob"
  end
end


