class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
		@contacts_alpha = @contacts.sort{|a,b| a['name']<=>b['name']}
		render 'index'
	end

	def new
		render 'new'
	end

	def create
	contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone => params[:contact][:phone],
      :email => params[:contact][:email])

    # Now we save the contact
    contact.save

    redirect_to("/contacts")
	end
end