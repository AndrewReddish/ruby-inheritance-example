require 'camaro'

describe Camaro do
  before(:example) do
    @subject = Camaro.new
  end
  describe ".accelerate" do
    it "will increment the current speed by 1" do
      initial_speed = @subject.instance_variable_get :@current_speed
      @subject.accelerate
      current_speed = @subject.instance_variable_get :@current_speed
      expect(current_speed - initial_speed).to eq(1)
    end
  end
  describe ".drive" do
    context "not at max speed" do
      it "should call 'accelerate'" do
        expect(@subject).to receive(:accelerate).at_least(:once).and_call_original
        @subject.drive
      end
      it "should accelerate until it hits max speed" do
        max_speed = @subject.instance_variable_get :@max_speed
        expect(@subject).to receive(:accelerate).at_least(:once).and_call_original
        @subject.drive
        current_speed = @subject.instance_variable_get :@current_speed
        expect(current_speed).to eq(max_speed)
        expect(@subject).not_to receive(:accelerate)
        @subject.drive
      end
    end
    context "at max speed" do
      it "should not accelerate and print that it hit the cars max speed" do
        max_speed = @subject.instance_variable_get :@max_speed
        @subject.instance_variable_set(:@current_speed, max_speed)
        expect(@subject).not_to receive(:accelerate)
        expect { @subject.drive }.to output("maximum speed achieved\n").to_stdout
        @subject.drive
      end
    end
  end
end
