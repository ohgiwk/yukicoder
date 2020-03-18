<?php

function filter(array $list, int $i): array
{
  return array_filter($list, fn (int $j) => $i == $j);
}

function main(): void
{
  $stdin = trim(fgets(STDIN));

  $list = array_map(fn (int $i) => $i % 6 + 1, range(1, $stdin));
  $list = array_map(fn (int $i) => count(filter($list, $i)), range(1, 6));
  echo array_reduce($list, fn (bool $p, int $i) => $p && $i === $list[0], true) ? "Yes" : "No";
}

main();
