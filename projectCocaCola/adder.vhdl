library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port (
        enable: in std_logic;
        reset : in std_logic;
        f0: in std_logic;
        f1: in std_logic;
        f2: in std_logic;
        sold: in std_logic;
        output_sum : out std_logic_vector(7 downto 0)
    );
end adder;

architecture Behavioral of adder is
    signal sum_reg : unsigned(7 downto 0) := "00000000";
begin
    process(f0, f1, f2, reset, sold)
    begin
   		if reset = '1' then
            sum_reg <= "00000000";
        elsif sold = '1' then
            sum_reg <= sum_reg - 100;
   		elsif enable = '1' then
            if rising_edge(f0) then
                sum_reg <= sum_reg + 5;
            elsif rising_edge(f1) then
                sum_reg <= sum_reg + 10;
            elsif rising_edge(f2) then
                sum_reg <= sum_reg + 50;
            end if;
        end if;
    end process;
    
    output_sum <= std_logic_vector(sum_reg);
end Behavioral;
