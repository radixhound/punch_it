require 'spec_helper'

describe StatusUpdateService do
  let(:user){ FactoryGirl.create(:user)}
  let(:status){"IN"}

  subject {StatusUpdateService.update(user: user, status: status)}

  it "creates an activity for a user" do
    lambda do
      subject
    end.should change(Activity, :count).by 1
  end

  context "user checks in" do
    let(:status) {"IN"}
    its(:activity) { should be_checked_in }

    context "with a description" do 
      let(:status) {"IN leaving at 4pm!"}
      its(:activity) { should be_checked_in }
      it { subject.activity.description.should =~ /^leaving at 4pm/}

      context "with a colon in the status" do
        let(:status) {"IN: leaving at 4pm!"}
        its(:activity) { should be_checked_in }
        it { subject.activity.description.should =~ /^leaving at 4pm/}

      end
    end
  end

  context "user checks out" do
    let(:status) {"OUT"}
    its(:activity) { should_not be_checked_in}

    context "with a description" do 
      let(:status) {"OUT going for lunch!"}
      its(:activity) { should_not be_checked_in }
      it { subject.activity.description.should =~ /^going for lunch/}

      context "with a colon in the status" do
        let(:status) {"OUT: going for lunch!"}
        its(:activity) { should_not be_checked_in }
        it { subject.activity.description.should =~ /^going for lunch/}
      end
    end
  end

end
