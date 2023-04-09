import os
import shutil

board = "RFSoC2x2"
fft_ip_dict = {
    'custom' : {
        'overlay_name' : 'rfsoc_sam_custom',
        'ip_repo_name' : 'SpectrumAnalyserCustom',
        'ip_repo_ver'  : '1.1',
        'default_size' : 8192,
        'capable_size' : [65536, 32768, 16384, 8192]
    }
}

def file_replace_string(filepath:os.path, oldstr:str, newstr:str):
    
    with open(filepath, 'r') as file:
        s = file.read()
        s = s.replace(oldstr, newstr)
        
    os.remove(filepath)

    with open(filepath, 'w') as file:
        file.write(s)

def customize_package(fft_ip:dict): 

    # ========== MODIFY BOARD FILES ==========
    repo_board_folder = f"boards/{board}/rfsoc_sam"
    dest_board_folder = f"boards/{board}/{fft_ip['overlay_name']}"

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
        f"{fft_ip['overlay_name']}.bit"
    )
    
    # rename design name in drivers/make_bitstream.tcl
    file_replace_string(
        f"{dest_board_folder}/make_bitstream.tcl",
        f"rfsoc_sam",
        f"{fft_ip['overlay_name']}"
    )

    # rename design name file in drivers/make_bitstream.tcl
    file_replace_string(
        f"{dest_board_folder}/make_block_design.tcl",
        f"rfsoc_sam",
        f"{fft_ip['overlay_name']}"
    )
    
    # rename block diagram tcl file
    shutil.move(
        f"{dest_board_folder}/rfsoc_sam.tcl",
        f"{dest_board_folder}/{fft_ip['overlay_name']}.tcl"
    )
    
    # rename IP name in block diagram tcl
    file_replace_string(
        f"{dest_board_folder}/{fft_ip['overlay_name']}.tcl",
        f"rfsoc_sam",
        f"{fft_ip['overlay_name']}"
    )
    file_replace_string(
        f"{dest_board_folder}/{fft_ip['overlay_name']}.tcl",
        f"SpectrumAnalyser:1.1",
        f"{fft_ip['ip_repo_name']}:{fft_ip['ip_repo_ver']}"
    )
    file_replace_string(
        f"{dest_board_folder}/{fft_ip['overlay_name']}.tcl",
        f"SpectrumAnalyser_",
        f"{fft_ip['ip_repo_name']}_"
    )
    
    # rename overlay name in notebooks
    file_replace_string(
        f"{dest_board_folder}/notebooks/rfsoc_spectrum_analysis.ipynb",
        f"rfsoc_sam",
        f"{fft_ip['overlay_name']}"
    )
    file_replace_string(
        f"{dest_board_folder}/notebooks/voila_rfsoc_spectrum_analyzer.ipynb",
        f"rfsoc_sam",
        f"{fft_ip['overlay_name']}"
    )

    # ========== MODIFY DRIVER FILES ==========
    
    repo_src_folder = f"rfsoc_sam"
    dest_src_folder = f"{fft_ip['overlay_name']}"
    
    # clean up previous runs
    if (os.path.exists(dest_src_folder)):
        shutil.rmtree(dest_src_folder)
        
    # copy rfsoc_sam folder
    shutil.copytree(repo_src_folder, dest_src_folder)
    
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self.ssr_packetsize = 512",
        f"self.ssr_packetsize = {int(fft_ip['default_size']/8)}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._window_packetsize = 4096",
        f"self._window_packetsize = {fft_ip['default_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._window_squaresum = 4096",
        f"self._window_squaresum = {fft_ip['default_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._window_sum = 4096",
        f"self._window_sum = {fft_ip['default_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._dma_length = 4096",
        f"self._dma_length = {fft_ip['default_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"if fft_size in [8192, 4096, 2048, 1024, 512, 256, 128, 64]",
        f"if fft_size in {fft_ip['capable_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"self._spectrum_fftselector+6",
        f"self._spectrum_fftselector+13"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"np.log2(fft_size)-6",
        f"np.log2(fft_size)-13"
    )
    file_replace_string(
        f"{dest_src_folder}/spectrum_analyser.py",
        f"SpectrumAnalyser:1.1",
        f"{fft_ip['ip_repo_name']}:{fft_ip['ip_repo_ver']}"
    )
    
    file_replace_string(
        f"{dest_src_folder}/receiver_frontend.py",
        f"'fftsize' : 2048",
        f"'fftsize' : {fft_ip['default_size']}"
    )
    file_replace_string(
        f"{dest_src_folder}/receiver_frontend.py",
        f"options=[64, 128, 256, 512, 1024, 2048, 4096, 8192],\n\
                                       value=4096,\n\
                                       dict_id='fftsize'",
        f"options={fft_ip['capable_size']},\n\
                                       value={fft_ip['default_size']},\n\
                                       dict_id='fftsize'"
    )

for fft_ip in fft_ip_dict.items():
    customize_package(fft_ip[1])