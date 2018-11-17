my $test_input = <<'END_MESSAGE';
Card #0
  Name: alsa_card.pci-0000_00_1f.3
  Driver: module-alsa-card.c
  Owner Module: 7
  Properties:
    alsa.card = "0"
    alsa.card_name = "HDA Intel PCH"
    alsa.long_card_name = "HDA Intel PCH at 0xf4240000 irq 128"
    alsa.driver_name = "snd_hda_intel"
    device.bus_path = "pci-0000:00:1f.3"
    sysfs.path = "/devices/pci0000:00/0000:00:1f.3/sound/card0"
    device.bus = "pci"
    device.vendor.id = "8086"
    device.vendor.name = "Intel Corporation"
    device.product.id = "a170"
    device.product.name = "Sunrise Point-H HD Audio"
    device.form_factor = "internal"
    device.string = "0"
    device.description = "Built-in Audio"
    module-udev-detect.discovered = "1"
    device.icon_name = "audio-card-pci"
  Profiles:
    input:analog-stereo: Analog Stereo Input (sinks: 0, sources: 1, priority: 60, available: yes)
    output:analog-stereo: Analog Stereo Output (sinks: 1, sources: 0, priority: 6000, available: yes)
    output:analog-stereo+input:analog-stereo: Analog Stereo Duplex (sinks: 1, sources: 1, priority: 6060, available: yes)
    output:analog-surround-40: Analog Surround 4.0 Output (sinks: 1, sources: 0, priority: 700, available: yes)
    output:analog-surround-40+input:analog-stereo: Analog Surround 4.0 Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 760, available: yes)
    output:hdmi-stereo: Digital Stereo (HDMI) Output (sinks: 1, sources: 0, priority: 5400, available: no)
    output:hdmi-stereo+input:analog-stereo: Digital Stereo (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5460, available: yes)
    output:hdmi-surround: Digital Surround 5.1 (HDMI) Output (sinks: 1, sources: 0, priority: 300, available: no)
    output:hdmi-surround+input:analog-stereo: Digital Surround 5.1 (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 360, available: yes)
    output:hdmi-surround71: Digital Surround 7.1 (HDMI) Output (sinks: 1, sources: 0, priority: 300, available: no)
    output:hdmi-surround71+input:analog-stereo: Digital Surround 7.1 (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 360, available: yes)
    output:hdmi-stereo-extra1: Digital Stereo (HDMI 2) Output (sinks: 1, sources: 0, priority: 5200, available: no)
    output:hdmi-stereo-extra1+input:analog-stereo: Digital Stereo (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5260, available: yes)
    output:hdmi-surround-extra1: Digital Surround 5.1 (HDMI 2) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround-extra1+input:analog-stereo: Digital Surround 5.1 (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-surround71-extra1: Digital Surround 7.1 (HDMI 2) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround71-extra1+input:analog-stereo: Digital Surround 7.1 (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-stereo-extra2: Digital Stereo (HDMI 3) Output (sinks: 1, sources: 0, priority: 5200, available: no)
    output:hdmi-stereo-extra2+input:analog-stereo: Digital Stereo (HDMI 3) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5260, available: yes)
    output:hdmi-surround-extra2: Digital Surround 5.1 (HDMI 3) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround-extra2+input:analog-stereo: Digital Surround 5.1 (HDMI 3) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-surround71-extra2: Digital Surround 7.1 (HDMI 3) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround71-extra2+input:analog-stereo: Digital Surround 7.1 (HDMI 3) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-stereo-extra3: Digital Stereo (HDMI 4) Output (sinks: 1, sources: 0, priority: 5200, available: no)
    output:hdmi-stereo-extra3+input:analog-stereo: Digital Stereo (HDMI 4) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5260, available: yes)
    output:hdmi-surround-extra3: Digital Surround 5.1 (HDMI 4) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround-extra3+input:analog-stereo: Digital Surround 5.1 (HDMI 4) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-surround71-extra3: Digital Surround 7.1 (HDMI 4) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround71-extra3+input:analog-stereo: Digital Surround 7.1 (HDMI 4) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-stereo-extra4: Digital Stereo (HDMI 5) Output (sinks: 1, sources: 0, priority: 5200, available: no)
    output:hdmi-stereo-extra4+input:analog-stereo: Digital Stereo (HDMI 5) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5260, available: yes)
    output:hdmi-surround-extra4: Digital Surround 5.1 (HDMI 5) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround-extra4+input:analog-stereo: Digital Surround 5.1 (HDMI 5) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    output:hdmi-surround71-extra4: Digital Surround 7.1 (HDMI 5) Output (sinks: 1, sources: 0, priority: 100, available: no)
    output:hdmi-surround71-extra4+input:analog-stereo: Digital Surround 7.1 (HDMI 5) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 160, available: yes)
    off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
  Active Profile: output:analog-stereo+input:analog-stereo
  Ports:
    analog-input-internal-mic: Internal Microphone (priority: 8900, latency offset: 0 usec)
      Properties:
        device.icon_name = "audio-input-microphone"
      Part of profile(s): input:analog-stereo, output:analog-stereo+input:analog-stereo, output:analog-surround-40+input:analog-stereo, output:hdmi-stereo+input:analog-stereo, output:hdmi-surround+input:analog-stereo, output:hdmi-surround71+input:analog-stereo, output:hdmi-stereo-extra1+input:analog-stereo, output:hdmi-surround-extra1+input:analog-stereo, output:hdmi-surround71-extra1+input:analog-stereo, output:hdmi-stereo-extra2+input:analog-stereo, output:hdmi-surround-extra2+input:analog-stereo, output:hdmi-surround71-extra2+input:analog-stereo, output:hdmi-stereo-extra3+input:analog-stereo, output:hdmi-surround-extra3+input:analog-stereo, output:hdmi-surround71-extra3+input:analog-stereo, output:hdmi-stereo-extra4+input:analog-stereo, output:hdmi-surround-extra4+input:analog-stereo, output:hdmi-surround71-extra4+input:analog-stereo
    analog-input-dock-mic: Dock Microphone (priority: 7800, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "audio-input-microphone"
      Part of profile(s): input:analog-stereo, output:analog-stereo+input:analog-stereo, output:analog-surround-40+input:analog-stereo, output:hdmi-stereo+input:analog-stereo, output:hdmi-surround+input:analog-stereo, output:hdmi-surround71+input:analog-stereo, output:hdmi-stereo-extra1+input:analog-stereo, output:hdmi-surround-extra1+input:analog-stereo, output:hdmi-surround71-extra1+input:analog-stereo, output:hdmi-stereo-extra2+input:analog-stereo, output:hdmi-surround-extra2+input:analog-stereo, output:hdmi-surround71-extra2+input:analog-stereo, output:hdmi-stereo-extra3+input:analog-stereo, output:hdmi-surround-extra3+input:analog-stereo, output:hdmi-surround71-extra3+input:analog-stereo, output:hdmi-stereo-extra4+input:analog-stereo, output:hdmi-surround-extra4+input:analog-stereo, output:hdmi-surround71-extra4+input:analog-stereo
    analog-input-mic: Microphone (priority: 8700, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "audio-input-microphone"
      Part of profile(s): input:analog-stereo, output:analog-stereo+input:analog-stereo, output:analog-surround-40+input:analog-stereo, output:hdmi-stereo+input:analog-stereo, output:hdmi-surround+input:analog-stereo, output:hdmi-surround71+input:analog-stereo, output:hdmi-stereo-extra1+input:analog-stereo, output:hdmi-surround-extra1+input:analog-stereo, output:hdmi-surround71-extra1+input:analog-stereo, output:hdmi-stereo-extra2+input:analog-stereo, output:hdmi-surround-extra2+input:analog-stereo, output:hdmi-surround71-extra2+input:analog-stereo, output:hdmi-stereo-extra3+input:analog-stereo, output:hdmi-surround-extra3+input:analog-stereo, output:hdmi-surround71-extra3+input:analog-stereo, output:hdmi-stereo-extra4+input:analog-stereo, output:hdmi-surround-extra4+input:analog-stereo, output:hdmi-surround71-extra4+input:analog-stereo
    analog-output-speaker: Speakers (priority: 10000, latency offset: 0 usec)
      Properties:
        device.icon_name = "audio-speakers"
      Part of profile(s): output:analog-stereo, output:analog-stereo+input:analog-stereo, output:analog-surround-40, output:analog-surround-40+input:analog-stereo
    analog-output-headphones: Headphones (priority: 9000, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "audio-headphones"
      Part of profile(s): output:analog-stereo, output:analog-stereo+input:analog-stereo
    hdmi-output-0: HDMI / DisplayPort (priority: 5900, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "video-display"
      Part of profile(s): output:hdmi-stereo, output:hdmi-stereo+input:analog-stereo, output:hdmi-surround, output:hdmi-surround+input:analog-stereo, output:hdmi-surround71, output:hdmi-surround71+input:analog-stereo
    hdmi-output-1: HDMI / DisplayPort 2 (priority: 5800, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "video-display"
      Part of profile(s): output:hdmi-stereo-extra1, output:hdmi-stereo-extra1+input:analog-stereo, output:hdmi-surround-extra1, output:hdmi-surround-extra1+input:analog-stereo, output:hdmi-surround71-extra1, output:hdmi-surround71-extra1+input:analog-stereo
    hdmi-output-2: HDMI / DisplayPort 3 (priority: 5700, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "video-display"
      Part of profile(s): output:hdmi-stereo-extra2, output:hdmi-stereo-extra2+input:analog-stereo, output:hdmi-surround-extra2, output:hdmi-surround-extra2+input:analog-stereo, output:hdmi-surround71-extra2, output:hdmi-surround71-extra2+input:analog-stereo
    hdmi-output-3: HDMI / DisplayPort 4 (priority: 5600, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "video-display"
      Part of profile(s): output:hdmi-stereo-extra3, output:hdmi-stereo-extra3+input:analog-stereo, output:hdmi-surround-extra3, output:hdmi-surround-extra3+input:analog-stereo, output:hdmi-surround71-extra3, output:hdmi-surround71-extra3+input:analog-stereo
    hdmi-output-4: HDMI / DisplayPort 5 (priority: 5500, latency offset: 0 usec, not available)
      Properties:
        device.icon_name = "video-display"
      Part of profile(s): output:hdmi-stereo-extra4, output:hdmi-stereo-extra4+input:analog-stereo, output:hdmi-surround-extra4, output:hdmi-surround-extra4+input:analog-stereo, output:hdmi-surround71-extra4, output:hdmi-surround71-extra4+input:analog-stereo
END_MESSAGE



use Data::Dumper;
use strict;
use warnings;

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

sub depth($) {
  my $line = shift;
  my $depth = 0;
  for(; substr($line, $depth, 1) eq "\t"; $depth++) {}
  return $depth;
}

sub processColonSpace($$) {
  my($name, $value) = @_;
  # @TODO: process parameters in parentheses
  return (trim($name), ("value" => trim($value)));
}

sub processEquals($$) {
  my($name, $value) = @_;
  return (trim($name), ("value" => trim($value)));
}

sub ProcessLine($) {
  my $line = shift;
  my $name, my $value;
  ($name, $value) = split(/: /, $line, 2);
  if($name ne $line) {
      return processColonSpace($name, $value);
  }
  ($name, $value) = split(/ = /, $line, 2);
  if($name ne $line) {
      return processEquals($name, $value);
  }
  if($line =~ /^\s*(\S+):$/) {
    return ("$1", ("value" => ""));
  }
  # error
  return
}

sub ProcessCard($) {
  my $lines = shift;
  my @stack;
  my $depth = 1;
  my %result = (value => '');
  
  push(@stack, \%result);
  while(@$lines > 0) {
    my $line = shift(@$lines);
    my($name, %dict) = ProcessLine($line);
    if(!defined $name) {
      print "Failed to preocess line '" . $line . "', skipping\n";
      next;
    }
    my $line_depth = depth($line);
    # print Dumper $line_depth;
    if($line_depth == $depth) {
      $stack[-1]{$name} = \%dict;
      push(@stack, \%dict);
      $depth++;
    }
    elsif($line_depth < $depth) {
      # print Dumper @stack;
      splice(@stack, -($depth - $line_depth));
      # print Dumper @stack;
      $stack[-1]{$name} = \%dict;
      push(@stack, \%dict);
      $depth = $line_depth + 1;
    }
    else {
      print "Sudden depth jump while processing line '" . $line . "', skipping\n"
    }
  }
  return %result;
}

sub ListCards() {
  my $output = `pactl list cards`;
  # my $output = $test_input;
  my %result;
  foreach my $card (split(/\n\n/, $output)) {
    my @lines = split(/\n/, $card);
    my $name = shift @lines;
    my %r = ProcessCard(\@lines);
    $result{$name} = \%r;
  }
  return %result;
}

# ListCards()
print Dumper ListCards()