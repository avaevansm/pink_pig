class CompaniesController < ApplicationController
  def index
    @company = params[:page].to_i
    per_page = 5
    @companies = Company.page(@page).per(per_page)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params["id"])
  end

  def update
    @company = Company.find(params["id"])

    if @company.update(company_params)
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params["id"])
    @company.destroy
    redirect_to companies_path
  end

  private def company_params
    params.require("company").permit(:name, :distributor)
  end
end
