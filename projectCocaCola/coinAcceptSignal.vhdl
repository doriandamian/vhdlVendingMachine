library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coinAcceptSignal is
    port(
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        notAllowed: in std_logic;
        am: out std_logic
    );
end coinAcceptSignal;

architecture Behavioral of coinAcceptSignal is

begin
process(a, b, c, notAllowed) begin
	if notAllowed = '1' then
		am <= '0';
	else
	    if a'event and a = '1' then
	        am <= '1';
	    elsif a'event and a = '0' then
	        am <= '0';
	    end if;
	    if b'event and b = '1' then
	        am <= '1';
	    elsif b'event and b = '0' then
	        am <= '0';
	    end if;
	    if c'event and c = '1' then
	        am <= '1';
	    elsif c'event and c = '0' then
	        am <= '0';
	    end if;
	end if;
end process;
end Behavioral;
