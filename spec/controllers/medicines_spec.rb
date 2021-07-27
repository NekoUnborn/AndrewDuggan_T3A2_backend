require 'rails_helper'
RSpec.describe MedicinesController , :type => :controller do
    describe 'GET Medicine' do
        it "Renders json of all the medicines in DB" do
            get :index
            medicine = [
                [
                    "Ritalin LA",
                    "Helps your concentration skills for 12 hours"
                ],
                [
                    "Melatonin",
                    "To help you sleep"
                ],
                [
                    "Dextroamphetamine",
                    "Helps your concentration skills for 4 hours"
                ],
                [
                    "Abilify",
                    "To help you calm down"
                ],
                [
                    "Ben",
                    "Ben si medicine now"
                ],
                [
                    "Andrew",
                    "Andrew is medicine"
                ],
                [
                    "Tim",
                    "Tim is now medicine"
                ],
                [
                    "Alex",
                    "Alex si med"
                ]
            ]
           parsed_body = JSON.parse(response.body)
           parsed_body.should == medicine
        end
    end
end