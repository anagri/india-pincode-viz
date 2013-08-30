class PincodeController < ApplicationController
  def index
    pincode = params[:pincode]

    if !pincode.present? || pincode.match(/\d+/).nil? || pincode.length > 6
      render :json => {}
      return
    end

    if pincode.length <= 2
      statement = ActiveRecord::Base.connection.select_all("select distinct(state) state from pincodes where pincode >= #{pincode.ljust(6, '0')} and pincode <= #{pincode.ljust(6, '9')}")
      states = statement.collect { |s| s['state'] }
      render :json => {states: states}
      return
    end

    statement = ActiveRecord::Base.connection.select_all("select distinct(district) district from pincodes where pincode >= #{pincode.ljust(6, '0')} and pincode <= #{pincode.ljust(6, '9')}")
    districts = statement.collect { |s| s['district'] }
    render :json => {districts: districts}
  end
end