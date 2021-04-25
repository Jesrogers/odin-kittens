class KittensController < ApplicationController
    include KittensHelper

    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            redirect_to root_path, notice: "New kitten created!"
        else
            flash.now.alert = "Error creating kitten"
            render :new
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            redirect_to @kitten, notice: "Kitten updated!"
        else
            flash.now.alert = "Error updating kitten"
            render :edit
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy

        redirect_to root_path, notice: "The poor kitten was destroyed"
    end
end
