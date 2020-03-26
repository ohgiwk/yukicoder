<?php

interface IOProvider
{
  function input(): string;
  function output(string $str): void;
}

class StandardIOProvider implements IOProvider
{
  function input(): string
  {
    return fgets(STDIN);
  }

  function output(string $str): void
  {
    echo $str;
  }
}


class TestIOProvider implements IOProvider
{
  function input(): string
  {
    return "6";
  }

  function output(string $str): void
  {
    echo $str;
  }
}

class Base
{
  function __construct(IOProvider $provider)
  {
    $this->io = $provider;
  }

  protected function read(): string
  {
    return $this->io->input();
  }

  protected function write(string $str): void
  {
    $this->io->output($str);
  }
}

class Program extends Base
{

  public function main(): void
  {
    $stdin = trim($this->read());

    $list = array_map(fn (int $i) => $i % 6 + 1, range(1, $stdin));
    $filter = fn (array $list, int $i) =>  array_filter($list, fn (int $j) => $i == $j);
    $list = array_map(fn (int $i) => count($filter($list, $i)), range(1, 6));
    $result = array_reduce($list, fn (bool $p, int $i) => $p && $i === $list[0], true);

    $this->write($result ? "Yes" : "No");
  }
}

function main(): void
{
  $provider = new TestIOProvider();
  $program = new Program($provider);
  $program->main();
}

main();
