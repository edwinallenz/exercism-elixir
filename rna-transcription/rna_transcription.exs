defmodule RNATranscription do
  def to_rna(dna) do
    Enum.map(dna, &rna_match(&1))
  end

  defp rna_match(char) do
    case char do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end
end

# Recursive solutoin
# defp execute_rna([]), do: []
# defp execute_rna([hd | tail]) do
#   [rna_match(hd) | execute_rna(tail)]
# end
