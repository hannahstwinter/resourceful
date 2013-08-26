require "spec_helper"

describe AgenciesController do
  describe "GET #index" do

  end
end
#   it "responds successfully with an HTTP 200 status code" do
#     get :index
#     expect(response).to be_success
#     expect(response.status).to eq(200)
#   end

#   it "renders the index template" do
#     get :index
#     expect(response).to render_template("index")
#   end

#   it "loads all of the posts into @posts" do
#     post1, post2 = Post.create!, Post.create!
#     get :index

#     expect(assigns(:posts)).to match_array([post1, post2])
#   end
def new
  @agency = Agency.new
end
def create
  @agency = Agency.new(params[:agency])
  @similar = Agency.find_similar(@agency.name)
  if @agency.save
    flash[:notice] = "Agency added."
    redirect_to root_url
  else
    @errors = @agency.errors.messages
    flash.now[:error] = "We need more information about the agency, please continue filling out the form."
    render :new
  end
end

def show
  @agency = Agency.find(params[:id])
end

def edit
  @agency = Agency.find(params[:id])
end

def update
  agency = Agency.update(params[:id], params[:agency])
  flash[:notice] = "#{agency.name}'s information has been updated."
  redirect_to "/agencies/#{agency.id}"
end

def destroy
  agency = Agency.find(params[:id])
  flash[:notice] = "#{agency.name}'s information has been deleted."
  Contact.update_agency_id(agency.id)
  Agency.destroy(agency.id)
  redirect_to root_url
end