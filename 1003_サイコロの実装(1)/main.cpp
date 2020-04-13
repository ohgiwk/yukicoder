#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<int> range(int start, int stop)
{
  vector<int> vec = {};
  for (int i = start; i <= stop; i++)
  {
    vec.push_back(i);
  }
  return vec;
}

template <typename T>
vector<T> map(vector<T> vec, function<T(T)> callback)
{
  vector<T> res = {};
  for (auto v : vec)
  {
    res.push_back(callback(v));
  }
  return res;
}

template <typename T>
vector<T> filter(vector<T> vec, function<T(T)> callback)
{
  vector<T> res = {};
  for (auto v : vec)
  {
    if (callback(v))
    {
      res.push_back(v);
    }
  }

  return res;
}

template <typename T>
bool all(vector<T> vec, function<bool(T)> callback)
{
  bool res = true;
  for (auto v : vec)
  {
    res = callback(v) && res;
  }
  return res;
}

void print_vec(vector<int> vec)
{
  for (int i = 0; i < vec.size(); i++)
  {
    printf("%d\n", vec[i]);
  }
}

class IOProvider
{
public:
  virtual string read() = 0;
  virtual void write(string s) = 0;
};

class TestIOProvider : public IOProvider
{
public:
  string read() override
  {
    return "6";
  }
  void write(string s) override
  {
    printf("%s\n", s.c_str());
  }
};

class Base
{
public:
  string read()
  {
    return "6";
  }

  void write(string s)
  {
    printf("%s\n", s.c_str());
  }
};

class Program final : public Base
{

public:
  IOProvider *io;

  Program(IOProvider *provider)
  {
    this->io = provider;
  }

  void main()
  {
    const string input = this->read();

    const int n = atoi(input.c_str());

    const vector<int> l1 = map<int>(range(1, n), [](int i) -> int { return i % 6 + 1; });
    const vector<int> l2 = map<int>(range(1, 6), [&](int i) -> int {
      return filter<int>(l1, [&](int j) -> bool { return i == j; }).size();
    });
    const bool result = all<int>(l2, [&](int i) -> bool { return i == l2[0]; });

    this->write(result ? "Yes" : "No");
  }
};

int main()
{
  auto *provider = new TestIOProvider;
  auto *program = new Program(provider);

  program->main();

  delete provider;
  delete program;
}
