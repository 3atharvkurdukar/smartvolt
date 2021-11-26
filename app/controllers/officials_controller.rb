class OfficialsController < ApplicationController
  before_action :require_official_signed_in

  layout "official"

  def index
    @customers = Customer.all
  end
end
