require "../enumerable"

describe Enumerable do 

	let(:example) {[5,6,7,8]}

describe "#my_each_with_index" do 
	it "returns elements and indexes"  do 
	expect {|b| [6,5,4,3,2].my_each_with_index(&b)}.to yield_successive_args([6,0],[5,1],[4,2],[3,3],[2,4])
	end	
	it "returns nothing"  do 
	expect {|b| [].my_each_with_index(&b)}.not_to yield_control
	end	

	context "when no block is given" do
      it "returns an enumerable object" do 
        expect([2,3,6].my_each).to be_instance_of(Enumerator)
      end
    end  
end


describe '#my_select' do 
	it "returns even numbers"  do 
	expect([2,5,6,7,9,8].my_select {|x| x%2 == 0}).to eql [2,6,8]	
	end	
	it "returns numbers  with 'even' keys" do 
	expect({"even" => 2,"odd" => 5,"even1" =>6,"odd1" =>7,"odd2" =>9,"even2" =>8}.my_select {|x,y| y % 2 == 0}).to eql({"even" => 2,"even1" =>6, "even2" =>8 })
	end	
	it "returns empty hash" do 
	expect({:even => 4, :odd => 7}.my_select{|x,y| y.class == String}).to eql({})
	end
end


describe "#my_map"  do 
	it "returns array with doubled elements" do 
	expect([1,2,3].my_map {|x| x*2}).to eql([2,4,6])
	end	
	it "takes a proc as argument" do 
	b = Proc.new do |x|
	x *= 3
	end	
	expect([1,2,3].my_map(&b)).to eql([3,6,9])
	end

it "uses proc when given both proc and block" do 
	b = Proc.new do |x|
	x *= 3
	end	
expect([1,2,3].my_map(b) {|x| x*2}).to eql([3,6,9])

end	
end

describe "#my_count" do 

it "returns size of array if no block given"  do

expect(example.my_count).to eql(4)
end	


it "returns size of array for a given condition"  do

expect(example.my_count {|x| x < 6}).to eql(1)
end	

end	

describe "#my_inject"  do 

it "returns a new array with items multiplied by ten " do 
expect(example.my_inject([]) { |memo,x| memo << x * 10}).to eql([50,60,70,80])
end	

it "returns a hash of inegers as key-value" do 
expect([1,2].my_inject({}) { |memo,x| memo[x] = x; memo } ).to eql({ 1 => 1,2 	=> 2})
end	
end


describe "#my_none?" do 

it "returns true" do 
expect(example.my_none? {|x| x > 9}).to equal true
end	

it "returns false " do 
expect([true,nil].my_none?{|x| x != false}).to eql false
end	


end

end	
