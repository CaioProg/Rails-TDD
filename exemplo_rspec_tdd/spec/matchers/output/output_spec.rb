describe 'Matcher output' do
    it { expect{ puts "Jackson"}.to output.to_stdout }
    it { expect{ print "Jackson"}.to output("Jackson").to_stdout }
    it { expect{ puts "Jackson pires"}.to output(/Jackson/).to_stdout }

    it { expect{ warn "Jackson"}.to output.to_stderr }
    it { expect{ warn "Jackson"}.to output("Jackson\n").to_stderr }
    it { expect{ warn "Jackson pires"}.to output(/Jackson/).to_stderr }

end