require 'rails_helper'
require 'application_helper'


describe 'navigate' do
  before do
    User.create(email: "newmeail@cool.com", password: "12345671", password_confirmation: "12345671", first_name: "Peter", last_name: "Andersson")
    visit user_session_path
    fill_in 'user[email]', with: "newmeail@cool.com"
    fill_in 'user[password]', with: "12345671"
    click_on 'Log in'
    visit posts_path
  end
  describe 'index' do
    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "has a title of Posts" do
      expect(page).to have_content(/Posts/)
    end

    it "has a list of Posts" do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: "1")
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: "1")
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(User.last).to be_valid
      expect(page.status_code).to eq(200)
      expect(page).to have_css(".new_post")
    end
    it 'can be created from new form page' do
      expect(User.last).to be_valid
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end

    it "will have a user associated with it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end
end
