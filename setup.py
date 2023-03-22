import sys
import os
import shutil
from distutils.dir_util import copy_tree

from setuptools import find_packages, setup

# global variables
fft_size=sys.argv.pop(1)
package_name = f'rfsoc_sam_{fft_size}'
pip_name = f'rfsoc-sam-{fft_size}'
board = os.environ['BOARD']
repo_board_folder = f'boards/{board}/rfsoc_sam_{fft_size}'
alt_overlay_folder = [f'boards/{board}/rfsoc_sam_{fft_size}']
board_notebooks_dir = os.environ['PYNQ_JUPYTER_NOTEBOOKS']
board_project_dir = os.path.join(board_notebooks_dir, f'spectrum-analyzer-{fft_size}')

data_files = []

# check whether board is supported
def check_env():
    if not os.path.isdir(repo_board_folder):
        raise ValueError("Board {} is not supported.".format(board))
    if not os.path.isdir(board_notebooks_dir):
        raise ValueError(
            "Directory {} does not exist.".format(board_notebooks_dir))
        
# check if the path already exists, delete if so
def check_path():
    if os.path.exists(board_project_dir):
        shutil.rmtree(board_project_dir)

# copy overlays to python package
def copy_overlays():
    for repo_folder in alt_overlay_folder:
        src_ol_dir = os.path.join(repo_folder, 'bitstream')
        dst_ol_dir = os.path.join(package_name, 'bitstream')
        copy_tree(src_ol_dir, dst_ol_dir)
        data_files.extend(
            [os.path.join("..", dst_ol_dir, f) for f in os.listdir(dst_ol_dir)])

# copy assets to python package
def copy_assets():
    src_at_dir = os.path.join(repo_board_folder, 'assets')
    dst_at_dir = os.path.join(package_name, 'assets')
    copy_tree(src_at_dir, dst_at_dir)
    data_files.extend(
        [os.path.join("..", dst_at_dir, f) for f in os.listdir(dst_at_dir)])

# copy board specific drivers
def copy_drivers():
    src_dr_dir = os.path.join(repo_board_folder, 'drivers')
    dst_dr_dir = os.path.join(package_name)
    copy_tree(src_dr_dir, dst_dr_dir)

# copy notebooks to jupyter home
def copy_notebooks():
    src_nb_dir = os.path.join(repo_board_folder, 'notebooks')
    dst_nb_dir = os.path.join(board_project_dir)
    copy_tree(src_nb_dir, dst_nb_dir)
    
# copy xrfclk file to python package (gen3 devices only)
def copy_xrfclk():
    src_at_dir = os.path.join(repo_board_folder, 'xrfclk')
    if os.path.exists(src_at_dir):
        dst_at_dir = os.path.join('xrfclk')
        copy_tree(src_at_dir, dst_at_dir)
        data_files.extend(
            [os.path.join("..", dst_at_dir, f) for f in os.listdir(dst_at_dir)])
    
check_env()
check_path()
copy_overlays()
copy_assets()
copy_drivers()
copy_notebooks()
copy_xrfclk()

setup(
    name=package_name,
    version='0.0.3',
    install_requires=[ 'pynq==2.7', ],
    url='https://github.com/strath-sdr/rfsoc_sam',
    license='BSD 3-Clause License',
    author="Kevin Kim",
    author_email="kevinmj.kim@mail.utoronto.ca",
    packages=[package_name,],
    package_dir={package_name:package_name, },
    package_data={package_name: data_files, },
    description=f"Fork of rfsoc_sam for custom FFT with size {fft_size}"
)

