class TrainsController < ApplicationController

	def new
		@train = Train.new
		@trains = Train.all
	end

	# POST /trains
  # POST /trains.json
  def create
    @train = Train.new(params[:train])

    respond_to do |format|
      if @train.save
        format.html { redirect_to new_train_path, notice: 'Train was successfully created.' }
        format.json { render json: @train, status: :created, location: @train }
      else
        format.html { render action: "new" }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_train_visiting_stations
  	TrainVisitingStation
  end
end
