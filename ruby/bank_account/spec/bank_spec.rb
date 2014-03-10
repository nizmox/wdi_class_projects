# .xxx = class method
# #xxx = the behaviour of an instance method

require_relative 'spec_helper'
require_relative '../bank'

describe Bank do
  #anytime the below tests run, this will be available
  let(:bank) { Bank.new('TD Bank') }

  describe '.new' do
    it 'should create a Bank object' do
      expect(bank).to_not eq nil
    end

    it 'should have a name' do
      expect(bank.name).to eq 'TD Bank'
    end

    it 'should have no accounts' do
      expect(bank.accounts.empty?).to eq true
    end
  end

  describe '#create_account' do
    it 'should create an account' do
      bank.create_account('Bob', 200) #Bob's account has $200
      expect(bank.accounts['Bob']).to eq 200
    end
  end

  describe '#deposit' do
    it 'should deposit money into a named account' do
      bank.create_account('Bob',200)
      bank.deposit('Bob',1000)
      expect(bank.accounts['Bob']).to eq 1200
    end
  end

  describe '#balance' do
    it 'should return the customer\'s account balance' do
      bank.create_account('Bob',200)
      expect(bank.balance('Bob')).to eq 200
    end
  end

  describe '#withdraw' do
    it 'should allow the customer to withdraw funds' do
      bank.create_account('Bob',1000)
      bank.withdraw('Bob',400)
      expect(bank.balance('Bob')).to eq (1000 - 400)
    end

    it 'should now allow the customer to overdraw their account' do
      bank.create_account('Bob',1000)
      bank.withdraw('Bob',10_000)
      expect(bank.balance('Bob')).to eq 1000
    end
  end

end