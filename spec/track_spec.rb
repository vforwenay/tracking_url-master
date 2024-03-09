require 'spec_helper'
require './track'

RSpec.describe Track do
  context "with gso" do
    
    it "valid tracking no" do
      tracking_no = "77085071017342912945"
      expect(Track.new.link(tracking_no,Gso)).to eq("https://www.gso.com/Trackshipment?TrackingNumbers=77085071017342912945")
    end

    it "valid tracking no with spaces" do
      tracking_no = "  77085071017342912945   "
      expect(Track.new.link(tracking_no,Gso)).to eq("https://www.gso.com/Trackshipment?TrackingNumbers=77085071017342912945")
    end

    it "check valid tracking ids" do
      valid_tracking_ids = [
          "77085071017304149045",  "77085071017342912945",
          "77085071017342912956",  "77085071017342912965",
          "77085071017304148807", "77085052217304142647",
          "77085052217304142604", "77085030617304133261"
      ]
      valid_tracking_ids.each do |tracking_no| 
        expect(Track.new.link(tracking_no,Gso)).to eq("https://www.gso.com/Trackshipment?TrackingNumbers=#{tracking_no}")
      end
    end

    it "invalid tracking no" do
      tracking_no = "77085071017342912945" << "123"
      expect(Track.new.link(tracking_no,Gso)).to be_nil            
    end

    it "check invalid tracking ids" do
      invalid_tracking_ids = [
          "70151520000337683171",  "1z6297940372553078",
          "9400111899223523321287",  "728803523361",
          "92748999984327000003259997", "728803517241",
          "950512035600000072", "728803526452" ,  "040250075205307" 
      ]
      invalid_tracking_ids.each do |tracking_no| 
        expect(Track.new.link(tracking_no,Gso)).to be_nil
      end
    end

  end
end