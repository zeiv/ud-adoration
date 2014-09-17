class TimeSlotsController < ApplicationController

  def destroy
    @time_slot = TimeSlot.find params[:id]
    respond_to do |format|
      if @time_slot.delete
        format.js   {}
        format.json { render json: @time_slot, status: :accepted }
      else
        format.json { render json: @time_slot.errors, status: :unprocessable_entity }
      end
    end
  end
end