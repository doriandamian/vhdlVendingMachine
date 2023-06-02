library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coinAccept is
    port(
        coin: in std_logic;
        accept: in std_logic;
        refuse: in std_logic;
        result: out std_logic
    );
end coinAccept;

architecture Behavioral of coinAccept is

begin
    process(coin) begin
    		result <= '0';
        if rising_edge(coin) then
            if accept = '1' and refuse = '0' then
            	result <= '0';
               result <= '1';
            elsif accept = '0' and refuse = '1' then
               result <= '0';
            end if;
        end if;
    end process;
end Behavioral;
