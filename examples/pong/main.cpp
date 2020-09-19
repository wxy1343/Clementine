﻿// Copyright 2020 SMS
// License(Apache-2.0)
// 乒乓球

#include <time.h>
#include <clem/clem.hpp>
#include <iostream>

#ifdef OS_WIN
#include <windows.h>
#define sleep(ms) Sleep(ms)
#else
#include <unistd.h>
#define sleep(ms) usleep(ms * 1000)
#endif

using namespace std;

int main()
{
	Color normal(mode_normal);
	Color green(fore_green);
	cout << green() << "Green" << normal() << endl;

	Terminal::Cursor::hide();
	srand(time(nullptr));

	Scene scene(Terminal::getWindowSize());

	auto& director = Director::instance();
	director.pushScene(&scene);
	director.run();

	getchar();
	getchar();
}
