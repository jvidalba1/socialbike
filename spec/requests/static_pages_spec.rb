require 'spec_helper'

describe "Static pages" do

  describe "Signup page" do
    it 'should have the content "Registro"' do
      visit '/users/new'
      page.should have_selector('h1', :text => 'Registro')
    end
  end

  describe "Signin page" do

    it 'should have the content "Entrada"' do
      visit '/signin'
      page.should have_selector('h1', :text => 'Entrada')
    end
  end

  describe 'Home page without signin' do

    it 'Welcome' do
      visit '/'
      page.should have_content('Bienvenido')
    end
  end


end
