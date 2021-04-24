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
    end

    def update
    end

    def destroy
    end
end
