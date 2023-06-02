LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY changeComponent IS
	PORT (
		sum: in std_logic_vector(7 downto 0);
		change: out std_logic_vector(7 downto 0);
		cokeDispence: out std_logic
	);
END changeComponent;

ARCHITECTURE TypeArchitecture OF changeComponent IS
	signal temp : unsigned(7 downto 0);
BEGIN
	process(sum)
	begin
		if unsigned(sum) >= 100 then
			cokeDispence <= '1';
			change <= std_logic_vector(unsigned(sum) - 100);
		else
			cokeDispence <= '0';
			change <= sum;
		end if;
	end process;
END TypeArchitecture;
