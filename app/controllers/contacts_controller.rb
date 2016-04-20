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

		if contact[:name] != "" && contact[:address] != ""
    		contact.save
    		redirect_to("/contacts")
    	else
    		render 'validation'
    	end

	end

	def profile
		@contact = Contact.find_by(id: params[:id])
		render 'profile'
	end

	def new_favorite
		contact_id = params[:contact]
		@the_contact = Contact.find_by(:id contact_id)
		@the_contact.favorite = true
		@the_contact.save
		render 'favorites'
	end
end
