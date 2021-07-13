#!/bin/bash

# Validate arguments
if [[ $# -eq 3 ]] ; then
    echo 'add singular plural model attributes as arguments'
    exit 1
fi

rails g resource ${1^} "${@:3}"

# upload to Github
git add .
git commit -m "$2"
git push origin main

# to heroku
# git push heroku main

# Modifying Controller

# scripting the controller
printf "\n\nScripting the controller\n\n"
sed -i '$d' ./app/controllers/$2_controller.rb
echo "  #  before_action :authenticate" >> ./app/controllers/$2_controller.rb
echo "  before_action :set_$1, only: %i[show create update destroy]" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

# Defining index
echo "  def index" >> ./app/controllers/$2_controller.rb
echo "    render json: ${1^}.all" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

# defining show
echo "  def show" >> ./app/controllers/$2_controller.rb
echo "    render json: @$1" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

# defining create
echo "  def create" >> ./app/controllers/$2_controller.rb
echo "    render json: ${1^}.create($1_params), status: :created" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

#defining update
echo "  def update" >> ./app/controllers/$2_controller.rb
echo "    if @$1.update($1_params)" >> ./app/controllers/$2_controller.rb
echo "      render json: @$1" >> ./app/controllers/$2_controller.rb
echo "    else" >> ./app/controllers/$2_controller.rb
echo "      render json: { error: 'Failed to update $1' }" >> ./app/controllers/$2_controller.rb
echo "    end" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

# Defining destroy
echo "  def destroy" >> ./app/controllers/$2_controller.rb
echo "    if @$1.destroy" >> ./app/controllers/$2_controller.rb
echo "      render status: :no_content" >> ./app/controllers/$2_controller.rb
echo "    else" >> ./app/controllers/$2_controller.rb
echo "      render json: { error: 'Failed to destroy $1' }, status: :unprocessable_entity" >> ./app/controllers/$2_controller.rb
echo "    end" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb

# setting up basic private methods
echo "  private" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb
echo "  def set_$1" >> ./app/controllers/$2_controller.rb
echo "    @$1 = ${1^}.find(params[:id])" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "" >> ./app/controllers/$2_controller.rb
echo "  def $2_params" >> ./app/controllers/$2_controller.rb
echo "    params.permit(:param1, :param2)" >> ./app/controllers/$2_controller.rb
echo "  end" >> ./app/controllers/$2_controller.rb
echo "end" >> ./app/controllers/$2_controller.rb

echo "Controller created"

git add .
git commit -m "Modified ${2^} controller"
git push origin main