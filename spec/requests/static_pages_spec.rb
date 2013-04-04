require 'spec_helper'

describe "Static pages" do

  describe "Signin page" do

    it 'should have the content bla' do
      visit '/signin'
      page.should have_selector('h1', :text => 'Entrada')
    end
  end

  describe 'home page' do

    it 'welcomes the user' do
      visit '/'
      page.should have_content('Bienvenido')
    end
  end
end
