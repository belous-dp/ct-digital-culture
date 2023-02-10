#!/bin/bash
echo $(grep -Ewo '[+][1-9][0-9]{1,14}' phone-numbers | wc -l)
