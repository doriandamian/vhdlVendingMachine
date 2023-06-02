LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY stockCheck IS
  PORT (
  	clkDecrease: in std_logic;
  	availableStock: out std_logic
    );
END stockCheck;

ARCHITECTURE TypeArchitecture OF stockCheck IS

signal stock: integer := 10;

BEGIN
	process(clkDecrease) begin


        if rising_edge(clkDecrease) then
                stock <= stock - 1;
        end if;
        if stock > 0 then
            availableStock <= '1';
        else
            availableStock <= '0';
        end if;
	end process;
END TypeArchitecture;
