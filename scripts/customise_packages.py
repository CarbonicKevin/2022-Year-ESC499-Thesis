import os
import shutil

board = "RFSoC2x2"
fft_ip_dict = {
    '4096' : '1.0',
    '8192' : '1.0',
    '16384': '1.0',
    '32768': '1.0',
    '65536': '1.0'
}

def file_replace_string(filepath:os.path, oldstr:str, newstr:str):
    
    with open(filepath, 'r') as file:
        s = file.read()
        s = s.replace(oldstr, newstr)
        
    os.remove(filepath)

    with open(filepath, 'w') as file:
        file.write(s)

def customize_package(fft_size:str, fft_ver:str): 

    # ========== MODIFY BOARD FILES ==========
    repo_board_folder = f'boards/{board}/rfsoc_sam'
    dest_board_folder = f'boards/{board}/rfsoc_sam_{fft_size}'

    # clean up previous runs    
    if (os.path.exists(dest_board_folder)):
        shutil.rmtree(dest_board_folder)

    # copy boards/rfsoc_sam folder
    shutil.copytree(repo_board_folder, dest_board_folder)
    # remove bitstream file - generate custom after
    shutil.rmtree(f'{dest_board_folder}/bitstream/')
    

    # rename bitstream file in drivers/overlay.py
    file_replace_string(
        f"{dest_board_folder}/drivers/overlay.py",
        f"rfsoc_sam.bit",
        f"rfsoc_sam_{fft_size}.bit"
    )
    
    # rename design name in drivers/make_bitstream.tcl
    file_replace_string(
        f"{dest_board_folder}/make_bitstream.tcl",
        f"rfsoc_sam",
        f"rfsoc_sam_{fft_size}"
    )

    # rename design name file in drivers/make_bitstream.tcl
    file_replace_string(
        f"{dest_board_folder}/make_block_design.tcl",
        f"rfsoc_sam",
        f"rfsoc_sam_{fft_size}"
    )
    
    # rename block diagram tcl file
    shutil.move(
        f"{dest_board_folder}/rfsoc_sam.tcl",
        f"{dest_board_folder}/rfsoc_sam_{fft_size}.tcl"
    )
    
    # rename IP name in block diagram tcl
    file_replace_string(
        f"{dest_board_folder}/rfsoc_sam_{fft_size}.tcl",
        f"rfsoc_sam",
        f"rfsoc_sam_{fft_size}"
    )
    file_replace_string(
        f"{dest_board_folder}/rfsoc_sam_{fft_size}.tcl",
        f"SpectrumAnalyser:1.1",
        f"SpectrumAnalyser{fft_size}:{fft_ver}"
    )
    file_replace_string(
        f"{dest_board_folder}/rfsoc_sam_{fft_size}.tcl",
        f"SpectrumAnalyser_",
        f"SpectrumAnalyser{fft_size}_"
    )
    
    # rename overlay name in notebooks
    file_replace_string(
        f"{dest_board_folder}/notebooks/rfsoc_spectrum_analysis.ipynb",
        f"rfsoc_sam",
        f"rfsoc_sam_{fft_size}"
    )
    file_replace_string(
        f"{dest_board_folder}/notebooks/voila_rfsoc_spectrum_analyzer.ipynb",
        f"rfsoc_sam",
        f"rfsoc_sam_{fft_size}"
    )

    # ========== MODIFY DRIVER FILES ==========
    
    repo_src_folder = f'rfsoc_sam'
    dest_src_folder = f'rfsoc_sam_{fft_size}'
    
    # clean up previous runs
    if (os.path.exists(dest_src_folder)):
        shutil.rmtree(dest_src_folder)
        
    # copy rfsoc_sam folder
    shutil.copytree(repo_src_folder, dest_src_folder)
    
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"if fft_size in [8192, 4096, 2048, 1024, 512, 256, 128, 64]",
        f"if fft_size in [{fft_size}]"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._spectrum_fftselector+6",
        f"self._spectrum_fftselector"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"np.log2(fft_size)-6",
        f"np.log2(fft_size)"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"SpectrumAnalyser:1.1",
        f"SpectrumAnalyser{fft_size}:{fft_ver}"
    )
    
    file_replace_string(
        f"{dest_src_folder}/receiver_frontend.py",
        f"'fftsize' : 2048",
        f"'fftsize' : {fft_size}"
    )
    file_replace_string(
        f"{dest_src_folder}/receiver_frontend.py",
        f"options=[64, 128, 256, 512, 1024, 2048, 4096, 8192],\n\
                                       value=4096,\n\
                                       dict_id='fftsize'",
        f"options=[{fft_size}],\n\
                                       value={fft_size},\n\
                                       dict_id='fftsize'"
    )

for fft_ip in fft_ip_dict.items():
    customize_package(fft_ip[0], fft_ip[1])